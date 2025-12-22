library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- per ogni moltiplicatore che andiamo a creare dobbiamo garantire che i suoi dati di ingresso stiano stabili almeno per il suo tempo di propagazione creiamo due registri
-- non uso un latch al posto dei due registri perchè quando il latch è trasparente data_in dovrebbe essere stabile per quello scritto sopra, ma io non posso garantirlo

entity Esercizio4 is
  Port(
    input_a : in std_logic_vector ( 31 DOWNTO 0) ;
    input_b : in std_logic_vector ( 31 DOWNTO 0) ;
    input_c : in std_logic_vector ( 31 DOWNTO 0) ;
    clk     : in std_logic;
    reset	: in std_logic;
	  
    result  : out std_logic_vector ( 31 DOWNTO 0)
  );
end Esercizio4;
-----------------------------------------------------------------------------------------------
-----------------------------------------------------------------------------------------------
  Architecture Behavioral of Esercizio4 is 
  
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
    
