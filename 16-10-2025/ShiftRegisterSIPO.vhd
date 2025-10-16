library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ShiftRegisterSIPO is
 
    Generic(
 
        SR_WIDTH : integer := 3
    );
 
    Port(
 
        reset    : in  std_logic;
        clk      : in  std_logic;
        data_in  : in  std_logic;
        data_out : out std_logic_vector(3 DOWNTO 0)
     );
     
    end ShiftRegisterSIPO;

architecture Behavioral of ShiftRegisterSIPO is


    component ff_d is
       
       	Port(
       	
		  reset_ff	: in std_logic;
		  clk_ff   : in std_logic;
		  d 	: in std_logic;
		  q 	: out std_logic
	   );
	   
	   end component;
	   
	   signal n : std_logic_vector(3 DOWNTO 0);
            

begin

         --INSTANZA INIZIALE
         ff_d_inst_0 : ff_d
            
            Port Map (
            
            reset_ff => reset,
            clk_ff   => clk,
            d        => data_in,
            q        => n(0)
            
            );
            
         --INIZIO DEL LOOP
   LOOP_GEN  : for I in 0 to 2 generate
        
        ff_d_inst_1 : ff_d
        
            Port Map (
            
            reset_ff => reset,
            clk_ff   => clk,
            d        => n(I),
            q        => n(I+1)
           
            );
            
             data_out(I) <= n(3-I) ;  --assegna a data out il valore di n      
    
    end generate;
                
                
end Behavioral;

