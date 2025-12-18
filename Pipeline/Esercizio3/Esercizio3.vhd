library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Esercizio2 is
  Port(
    input_a : in std_logic_vector ( 31 DOWNTO 0);
    input_b : in std_logic_vector ( 31 DOWNTO 0);
    input_c : in std_logic_vector ( 31 DOWNTO 0);
    clk     : in std_logic;

    result : out std_logic_vector ( 31 DOWNTO 0)
  );
end Esercizio2;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
  Architecture Behavioral of Esercizio2 is 
  
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
	      result	=> n2
      );

      result <= std_logic_vector(n2);

    process ( clk , reset ) 
      begin
        if reset = '1' then
          Q <= (Others => '0');
        elsif rising_edge(clk) then
          Q<=n2;
        end if;
      end process;
        
 end Behavioral;   
    
