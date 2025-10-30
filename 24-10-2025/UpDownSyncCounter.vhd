-- IMPLEMENTAZIONE DI UN CONTATORE CHE SOMMA O SOTTRAE 1 AL VARIARE DEI SUOI DUE INGRESSI: SE SONO DIVERSI SOMMA O SOTTRAE 1
library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;


entity UpDownSyncCounter is
    Generic(
        COUNT_WIDTH : integer := 4
        );
        
        Port(
        reset       : in std_logic;
        clk         : in std_logic;
        inc_count   : in std_logic;
        dec_count   : in std_logic;
        count       : out std_logic_vector (COUNT_WIDTH-1 DOWNTO 0) --SIGNED
        );  
end UpDownSyncCounter;

    
architecture Behavioral of UpDownSyncCounter is

component ff_d is
        Port(
		reset	: in std_logic;
		clk		: in std_logic;

		d 	    : in std_logic;
		q 	    : out std_logic
	);
	end component;

	signal inc_signal: std_logic_vector (COUNT_WIDTH-1 DOWNTO 0);
	signal dec_signal: std_logic_vector (COUNT_WIDTH-1 DOWNTO 0);
	
	signal n1 std_logic_vector(COUNT_WIDTH-1 DOWNTO 0);
	signal n2 std_logic_vector(COUNT_WIDTH-1 DOWNTO 0);

begin

	inc_signal <= inc_count;
	dec_signal <= dec_count; 
	
	LOOP_int for I in 0 TO COUNT_WIDTH-1 generate -- CREO QUANTI FLIP FLOP MI SERVONO
		ff_inst : ff_d
			Port map(
				d => n1(I),    
                q => n2(I),     
                
                clk => clk,
                reset => reset
				);
	end generate
	count <= signed(n2); -- METTO IN COUNT N2 (CASTATO SIGNED)??!!
	n1 <= signed(n2) + signed(inc_signal) - signed(dec_signal)   -- ESEGUO UNA CONVERSIONE IN SIGNED
		
	
		
end Behavioral;
