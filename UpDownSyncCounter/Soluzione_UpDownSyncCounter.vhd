library IEEE;
use IEEE.STD_LOGIC_1164.ALL;
use IEEE.NUMERIC_STD.ALL;       --PER POTER USARE LA LIBRERIA NUMERIC


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

component my_register is
        Port(
                reset        : in std_logic;
                clk          : in std_logic;

                D            : in std_logic_vector; -- Per la dimensione di D e Q, che sarà la stessa, non possono essere predefinite
                Q            : out std_logic_vector -- Scrivo std_logic_vector senza scrivere la dimensione, uso un unconstraint array
        );
        end component;

signal addendo : signed (0 TO 1);                   -- LA SOMMA, PER DUE TIPI SIGNED, È DEFINITA ANCHE PER ADDENDI CHE HANNO LUNGHEZZA DIFFERENTE ED IL RIS È IL MAX
signal reg_out : std_logic_vector(count'RANGE);   
signal reg_in  : std_logic_vector(count'RANGE);

begin

my_register_inst : my_register
      Port Map (
          reset  => reset,
          clk    => clk,

          D      => reg_in,
          Q      => reg_out;  
          );

    reg_in <= std_logic_vector (signed(reg_out) + addendo) ;  -- NELLO STD_LOGIC_VECTOR LA SOMMA NON È DEFINITA

    addendo <= to_signed(1 , 2 )  when inc_count = '1' and dec_count = '0' else   --ATTENZIONE! ADDENDO È UN SIGNED MENTRE .1 È UNO SCALARE
               to signed(-1, 2 )  when inc_count = '1' and dec_count = '0' else   --METTO TO SIGNED ( VALORE , DIMENSIONE) 
               to signed(0 , 2 ) ;

    count <= reg_out;

end Behavioral;
 




    
