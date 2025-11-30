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

    signal t_on_int    : integer;
    signal t_total_int : integer;
    signal counter     : integer := 0 ;
   
begin
    
    process ( reset, clk ) 
        begin
        
            if reset ='1' then
                pwm_out <='0';
                counter <= 0 ;
                t_on_int    <= to_integer (unsigned(t_on)) ;  
                t_total_int <= to_integer (unsigned(t_total)) ; 
    
            elsif rising_edge(clk) then
            
                counter <= counter +1;
                 
                if counter < t_on_int+1 then
                    pwm_out <= '1';
                elsif counter > t_on_int then
                    pwm_out <= '0'; 
                elsif counter=t_total_int then
                    counter <=  0 ;   
                end if;
                
                t_on_int    <= to_integer (unsigned(t_on)) ;  
                t_total_int <= to_integer (unsigned(t_total)) ;  -- Ogni volta ripeto la conversione perchè potrebbero essere cambiati nel frattempo t_on e t_total
            end if;
    end process;    

end Behavioral;
