library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- calcolo il tempo di propagazione della logica combinatoria andando semplicemente a vedere il percorso più lungo : Tpd = 15ns+7ns = 22ns
-- il tempo di contaminazione invece è il minore possibile,  ovvero quando cambio c, quindi Tcd = 2ns

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
	input_a			: in  unsigned(31 DOWNTO 0);
	input_b			: in  unsigned(31 DOWNTO 0);
	result			: out unsigned(31 DOWNTO 0)
	);
    end component;
    
    component adder is
	Port (
	input_a			: in  unsigned(31 DOWNTO 0);
	input_b			: in  unsigned(31 DOWNTO 0);
	result			: out unsigned(31 DOWNTO 0)
	);
    end component;

    signal out_mul : unsigned(31 DOWNTO 0);

---------------------------------------------------------------------------------------------
----------------------------------------------------------------------------------------------

    begin

    MULTIPLIER_INST : multiplier
      Port map ( 
          input_a   => unsigned(input_a),  -- casto direttamente sul port map
	      input_b	=> unsigned(input_b),  -- casto direttamente sul port map
	      result	=> out_mul
      );
      
    ADDER_INST : adder
      Port map ( 
          input_a   => unsigned(input_c),  -- casto direttamente sul port map
	      input_b	=> out_mul, 
	      std_logic_vector(result)	=> result  -- casto anche al contrario sul port map !?
      );
      
 end Behavioral;   
