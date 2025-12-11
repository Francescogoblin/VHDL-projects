Library IEEE;
use IEEE.std_logic_1164.all;

entity Mealy_EdgeDetector is
  Port( 
    clk : in std_logic;
    reset : in std_logic;

    signal_in : in std_logic;
    upEdge    : out std_logic;
    downEdge  : out std_logic
    );
end Mealy_EdgeDetector;

  architecture Behavioral of Mealy_EdgeDetector is

  type nuovotipo is (rst , up, down ) ; 
  signal state , nextstate : nuovotipo;

    begin
    ------------------------------------------------------------------------------------------------------------------------
    --STATE MEMORY
    -------------------------------------------------------------------------------------------------------------------------     
    process ( clk , reset ) 
      begin
        if reset = '1' then 
          state <= rst;
          upEdge <= '0';
          downEdge <= '0';
        end if;
        if rising_edge(clk) then
          state <= nextstate;
        end if;
          
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
                upEdge   <= '0';
                downEdge <= '0';
              elsif signal_in = '1' then
                nextstate <= up;
                upEdge   <= '1';
                downEdge <= '0';
              end if;
                
            when up =>
              if signal_in = '0' then
                nextstate <= down;
                upEdge   <= '0';
                downEdge <= '1';
              elsif signal_in = '1' then
                nextstate <= up;
                upEdge   <= '0';
                downEdge <= '0';
              end if;
                      
            when down =>
              if signal_in = '0' then
                nextstate <= down;
                upEdge   <= '0';
                downEdge <= '0';
              elsif signal_in = '1' then
                nextstate <= up;
                upEdge   <= '1';
                downEdge <= '0';
              end if;

         end case;

   end process;

     -------------------------------------------------------------------------------------------------------------------------     


end Behavioral;
