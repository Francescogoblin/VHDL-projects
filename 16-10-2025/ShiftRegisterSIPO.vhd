

library IEEE;
	use IEEE.STD_LOGIC_1164.ALL;


entity ShiftRegisterSIPO is
 
    Generic(
       SR_WIDTH :integer:=4
     );

   Port(
     
      reset    : in std_logic;
      clk      : in std_logic;
      data_in  : in std_logic;
      data_out : out std_logic_vector(SR_WIDTH-1DOWNTO0)
     
     );
 end ShiftRegisterSIPO


architecture Behavioral of ShiftRegisterSIPO is
  
  component ff_d is
  	Port(
  		reset	: in std_logic;
  		clk		: in std_logic;
  		d 		:	in std_logic;
  		q 		: out std_logic
  	);
  end component;

begin

end Behavioral;
