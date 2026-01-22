library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.numeric_std.all;

-- Vogliamo lavorare a 100Mhz , quindi il periodo di clock che vogliamo è di 10ns
-- Utilizziamo la tecnica dell'interleaving, andando a spezzare in due blocchi paralleli il blocco da 15ns, facendolo così lavorare a 7,5ns
-- In questo caso, dopo che il blocco ha finito di lavorare , prima che gli venga righiesto il dato che ha appena calcolato ci sono ancora 2,5ns, che è il nostro massimo Tsetup
-- Considerando registri ideali il minimo periodo di clock sarebbe proprio 7,5ns , che da una frequenza massima di clk di 133Mhz
-- La latenza del sistema quindi sarà 10ns*2 = 20ns
-- Il throughput dipenderà ancora dal tempo di clock, e quindi sarà THR= 100Mhz * 4Byte = 400Mbyte/s = 3,2 Gbyte/S


-- Per effettuare l'interleaving non uso un latch al posto dei due registri perchè quando il latch è trasparente data_in dovrebbe essere stabile , ma io non posso garantirlo

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

	signal input_a_replica_a , input_a_replica_b , input_b_replica_a , input_b_replica_b  : unsigned(31 DOWNTO 0);
	signal out_mul_rep_a , out_mul_rep_b : unsigned( 31 DOWNTO 0 );
	signal out_mul , out_add : unsigned( 31 DOWNTO 0 );
    signal En_a : std_logic := '0';
 	signal En_a : std_logic := '1';

	type SR_type is array (o TO 2 ) of std_logic_vector( 31 DOWNTO 0 ) ;
	signal SR_input_c : SR_type 
	
begin

    MULTIPLIER_INST_a : multiplier
      Port map ( 
          input_a   => input_a_replica_a,
	      input_b	=> input_b_replica_a,
	      result	=> out_mul_rep_a
      );

	 MULTIPLIER_INST_b : multiplier
      Port map ( 
          input_a   => input_a_replica_b,
	      input_b	=> input_b_replica_b,
	      result	=> out_mul_rep_b
	      );
      
    ADDER_INST : adder
      Port map ( 
          input_a   => unsigned(SR_input_c(2)),
	      input_b	=> out_mul,
	      result	=> out_add
      );

		process_smistamento_ingressi : process ( clk  , reset ) 
		begin
				if reset = '1' then
					result <= (Others => '0');
			
				elsif rising_edge(clk) = '1' then
					
					if En_a = '1' then
						input_a_replica_a <= unsigned (input_a);
						input_b_replica_a <= unsigned (input_b);
					else 
						input_a_replica_a <= input_a_replica_a;
						input_b_replica_a <= input_b_replica_a;
					end if;

					if En_b = '1' then
						input_a_replica_b <= unsigned (input_a);
						input_b_replica_b <= unsigned (input_b);
					else 
						input_a_replica_b <= input_a_replica_b;
						input_b_replica_b <= input_b_replica_b;
					end if;				
		end process;

						
		generation_ enable : process ( clk , reset ) 
		begin 
				if reset = '1' then
					En_a <= '0';
					En_b <= '1';
				elsif rising_edge(clk) = '1' then
					En_a <= not ( En_a) ;
					En_b <= not ( En_b) ;
				end if;
		end process;


		process_multiplexer : process ( clk ) 
		begin
				if rising_edge(clk) = '1' then
					if En_a = '0' then
						 out_mul <= out_mul_replica_a;
					else out_mul <= out_mul_replica_b;
				end if ;
		end process;

		process_shift_register_for_retarding : process ( clk  )  --ritardo di 3 cicli di clock
		begin
				if rising_edge(clk) = '1' then
					SR_input_c(0) <= input_c;
					SR_input_c( 1 TO 2) <= SR_input_c( 0 TO 1);
				end if ;
		end process;

		process_exit : process ( clk  ) 
		begin
				if rising_edge(clk) = '1' then
					result <= std_logic_vector(out_add);
				end if ;
		end process;
		
      
 end Behavioral;   
    
