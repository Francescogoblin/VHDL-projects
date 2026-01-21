Library IEEE;
use IEEE.std_logic_1164.all;

entity Moore_EdgeDetector is
  Port( 
    clk   : in std_logic;
    reset : in std_logic;

    signal_in : in std_logic;
    upEdge    : out std_logic;
    downEdge  : out std_logic
    );
end Moore_EdgeDetector;


  architecture Behavioral of Moore_EdgeDetector is

  type nuovotipo is ( rst , parking , up, down ); --ogni stato può assumere uno di questi valori
  signal state , nextstate : nuovotipo;           --creazione dei due segnali di stato e del nuovo stato, entrambi del tipo appena creato

    begin
    ------------------------------------------------------------------------------------------------------------------------- 
    --STATE MEMORY: avviene la transizione al nuovo stato
    -------------------------------------------------------------------------------------------------------------------------     
    process ( clk , reset ) 
      begin
        if reset = '1' then --semplice procedura: si ritorna allo stato di reset se il reset è alto
          state <= rst;
        end if;
        
        if rising_edge(clk) then  -- ogni volta che clocka si passa al nuovo stato
          state <= nextstate;
        end if;
          
    end process;
    -------------------------------------------------------------------------------------------------------------------------     
    --OUTPUT LOGIC : si calcola l'uscita
    -------------------------------------------------------------------------------------------------------------------------     
    process ( state) -- faccio questa operazione ogni volta che cambia lo stato, perchè sennò non ha senso, e l'uscita rimane uguale a prima
        begin
          case state is
            when rst =>
              upEdge   <= '0';
              downEdge <= '0';
            when up =>
              upEdge   <= '1';
              downEdge <= '0';
            when down =>
              upEdge   <= '0';
              downEdge <= '1';
            when parking =>
              upEdge   <= '0';
              downEdge <= '0';
              end case;
    end process;
     -------------------------------------------------------------------------------------------------------------------------     


     --TRANSITION LOGIC : avviene il calcolo del nuovo stato
     -------------------------------------------------------------------------------------------------------------------------     
    process ( signal_in , state ) 
        begin
          case state is
            
            when rst =>
              if signal_in = '0' then
                nextstate <= rst;
              elsif signal_in = '1' then
                nextstate <= up;
              end if;
                
            when up =>
              if signal_in = '0' then
                nextstate <= down;
              elsif signal_in = '1' then
                nextstate <= parking;
              end if;
                      
            when down =>
              if signal_in = '0' then
                nextstate <= rst;
              elsif signal_in = '1' then
                nextstate <= up;
              end if;

            when parking =>
              if signal_in = '0' then
                nextstate <= down;
              elsif signal_in = '1' then
                nextstate <= parking;
              end if;
            end case;
   end process;

     -------------------------------------------------------------------------------------------------------------------------    

    --state e next state sono ti un tipo custom type di tipo enum dove i possibili valori sono gli stati
    -- in tutte le macchine a stati è bene specificare qual è lo stato iniziale!!!
