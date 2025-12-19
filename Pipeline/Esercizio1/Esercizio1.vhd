library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Esercizio1 is
  Port(
    input_a : in std_logic_vector ( 31 DOWNTO 0) ;
    input_b : in std_logic_vector ( 31 DOWNTO 0) ;
    input_c : in std_logic_vector ( 31 DOWNTO 0) ;
    clk     : in std_logic;
    reset	: in std_logic;
    result  : out std_logic_vector ( 31 DOWNTO 0)
  );
end Esercizio1;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
  Architecture Behavioral of Esercizio1 is 
  
    component multiplier is
	Port (
	input_a			: in unsigned(31 DOWNTO 0);
	input_b			: in unsigned(31 DOWNTO 0);
	result			: out unsigned(31 DOWNTO 0)
	);
    end component;
    
    component adder is
	Port (
	input_a			: in unsigned(31 DOWNTO 0);
	input_b			: in unsigned(31 DOWNTO 0);
	result			: out unsigned(31 DOWNTO 0)
	);
    end component;

    signal n1 : unsigned(31 DOWNTO 0);
    signal n2 : unsigned(31 DOWNTO 0);

    begin

    MULTIPLIER_INST : multiplier
      Port map ( 
          input_a   => unsigned(input_a),
	      input_b	=> unsigned(input_b),
	      result	=> n1
      );
      
    ADDER_INST : adder
      Port map ( 
          input_a   => unsigned(input_c),
	      input_b	=> n1,
	      std_logic_vector(result)	=> n2
      );

      result <= n2;
      
 end Behavioral;   
