library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Ci viene chiesto di lavorare a 50Mhz , questo vuol dire che i registri dovranno avere un Tclk di 20ns
-- Andiamo a spezzare il processo combinatorio più lungo, così che il tempo di propagazione totale è 15ns.
-- In questo caso vediamo che la logica da 15ns ha 5ns di tempo extra prima che il registro le richieda il dato che ha appena calcolato. Questo è il massimo Tsetup --> Tsetup max = 5ns
-- Considerando i registri ideali potremmo diminuire il periodo di clk fino a un tempo uguale al tempo della logica più lenta, ovvero 15ns. Fmax = 1/15ns = 66,7 Mhz
-- La latenza del sistema è .

entity Esercizio3 is
  Port(
    input_a : in std_logic_vector ( 31 DOWNTO 0) ;
    input_b : in std_logic_vector ( 31 DOWNTO 0) ;
    input_c : in std_logic_vector ( 31 DOWNTO 0) ;
    clk     : in std_logic;
    reset	: in std_logic;
	  
    result  : out std_logic_vector ( 31 DOWNTO 0)
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

    signal out_mul   : unsigned(31 DOWNTO 0);
	signal out_adder : unsigned(31 DOWNTO 0);
	signal out_mul_reg : unsigned(31 DOWNTO 0);
	signal input_c_reg : unsigned(31 DOWNTO 0);
    
begin

    MULTIPLIER_INST : multiplier
      Port map ( 
          input_a   => unsigned(input_a),
	      input_b	=> unsigned(input_b),
	      result	=> out_mul
      );
      
    ADDER_INST : adder
      Port map ( 
          input_a   => input_c_reg,
	      input_b	=> out_mul_reg
	      result	=> out_adder
      );

		process ( clk  , reset ) 
		begin
				if reset = '1' then
					result <= (Others => '0');
				elsif rising_edge(clk) = '1' then
					result <= std_logic_vector(out_add);
					input_c_reg <= unsigned(input_c);
					out_mul_reg <= out_mul
				end if;
		end process;
      
 end Behavioral;   
    
