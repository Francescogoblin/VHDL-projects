library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;

entity PWM is
 Port (
        reset  : in std_logic;
        clk    : in std_logic;
        t_on   : in std_logic_vector(8-1 DOWNTO 0);-- UNSIGNED
        t_total: in std_logic_vector(8-1 DOWNTO 0);-- UNSIGNED
        pwm_out: out std_logic
 );
 end PWM;

architecture Behavioral of PWM is

     signal count : unsigned(t_total'RANGE);

begin
    process (clk,reset)
    begin
      if reset = '1' then
        pwm_out <= '0';
        count   <= (Others => '0'); 

      elsif rising_edge(clk) then

        if    (unsigned(t_on) >=    count      ) then
          pwm_out <= '1';
        elsif (      count    >= unsigned(t_on)) then
          pwm_out <= '0';
        end if;
        
        count <= count + 1;

        if     (count = unsigned(t_total)) then --reset del counter
          count <= (Others => '0');
        end if;
       end if;
                             
    end process;  
    
end Behavioral;
