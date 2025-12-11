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

  type nuovotipo is ( rst , parking , up, down ); 
  signal state , nextstate : nuovotipo;

    begin
    ------------------------------------------------------------------------------------------------------------------------- 
    --STATE MEMORY
    -------------------------------------------------------------------------------------------------------------------------     
    process ( clk , reset ) 
      begin
        if reset = '1' then 
          state <= rst;
        end if;
        
        if rising_edge(clk) then
          state <= nextstate;
        end if;
          
    end process;
    -------------------------------------------------------------------------------------------------------------------------     
    --OUTPUT LOGIC  
    -------------------------------------------------------------------------------------------------------------------------     
    process ( state)
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


     --TRANSITION LOGIC
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
