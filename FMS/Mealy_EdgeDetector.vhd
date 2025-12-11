Library IEEE;
use IEEE.std_logic_1164.all;

entity Moore_EdgeDetector is
  Port( 
    clk : in std_logic;
    reset : in std_logic;

    signal_in : in std_logic;
    upEdge    : out std_logic;
    downEdge  : out std_logic;
    );
end EdgeDetector;

  architecture Behavioral of EdgeDetector is

  type nuovotipo is (reset , up, down ) ; 
  signal state , nextstate : nuovotipo;

    begin
    ------------------------------------------------------------------------------------------------------------------------
    --STATE MEMORY
    -------------------------------------------------------------------------------------------------------------------------     
    process ( clk , reset ) 
      begin
        if reset = 1 then 
          state <= reset;
          upEdge <= '0';
          downEdge <= '1';
        elsif rising_edge(clk) = 1 then
          state <= nextstate;
        end if;
          
    end process;
    -------------------------------------------------------------------------------------------------------------------------   
     --TRANSITION LOGIC
     -------------------------------------------------------------------------------------------------------------------------     
    process ( signal_in , state ) 
        begin
          case state is
            
            when reset =>
              if signal_in = '0' then
                nextstate <= reset;
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
