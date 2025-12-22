
library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Latenza= 1 ciclo di clock = Tclk.  Throughput del sistema --> dipende dal tempo di clock. Se ad esempio ho un clock a 45MHz il throughput è 45MHz * 32bit al secondo = 45MHz * 4Byte al secondo = 1440 MBit/sec 

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

    signal out_mul   : unsigned(31 DOWNTO 0);
	signal out_adder : unsigned(31 DOWNTO 0);

    begin

    MULTIPLIER_INST : multiplier
      Port map ( 
          input_a   => unsigned(input_a),
	      input_b	=> unsigned(input_b),
	      result	=> out_mul
      );
      
    ADDER_INST : adder
      Port map ( 
          input_a   => unsigned(input_c),
	      input_b	=> out_mul
	      result	=> out_adder
      );

		process ( clk  , reset ) 
		begin
				if reset = '1' then
					result <= (Others => '0');
				elsif rising_edge(clk) = '1' then
					result <= std_logic_vector(out_add);
				end if;
		end process;
      
 end Behavioral;   
    
