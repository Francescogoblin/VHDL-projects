library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

entity Esercizio3 is
  Port(
    input_a : in std_logic_vector ( 31 DOWNTO 0);
    input_b : in std_logic_vector ( 31 DOWNTO 0);
    input_c : in std_logic_vector ( 31 DOWNTO 0);
    clk     : in std_logic;

    result : out std_logic_vector ( 31 DOWNTO 0)
  );
end Esercizio3;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
  Architecture Behavioral of Esercizio3 is 
  
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

    signal n1 : unsigned(31 DOWNTO 0); -- segnale per l'uscita del multiplier
    signal n2 : unsigned(31 DOWNTO 0); -- segnale per l'uscita dell'adder
	signal n3 : unsigned(31 DOWNTO 0); -- segnale per spezzare l'uscita del multiplier
    signal n4 : unsigned(31 DOWNTO 0); -- segnale per spezzare l'ingresso dell'adder
	
    begin

    MULTIPLIER_INST : multiplier
      Port map ( 
          input_a   => unsigned(input_a),
	      input_b	=> unsigned(input_b),
	      result	=> n1
      );
      
    ADDER_INST : adder
      Port map ( 
          input_a   => n4,
	      input_b	=> n3,
	      result	=> n2
      );


    process ( clk , reset ) 
      begin
        if reset = '1' then
          result <= (Others => '0');
        elsif rising_edge(clk) then
          result<=std_logic_vector(n2);
		  n3<=n2;
		  n4<=unsigned(input_c);
        end if;
      end process;
        
 end Behavioral;   
    
