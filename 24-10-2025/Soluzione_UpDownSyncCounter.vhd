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

entity my_register is
        Port(
                reset        : in std_logic;
                clk          : in std_logic;

                D            : in std_logic_vector; -- Per la dimensione di D e Q, che sarà la stessa, non possono essere predefinite
                Q            : out std_logic_vector -- Scrivo std_logic_vector senza scrivere la dimensione, uso un unconstraint array
        );
        end component;


architecture Behavioral of UpDownSyncCounter is

component ff_d is
        Port(
                reset        : in std_logic;
                clk          : in std_logic;

                d            : in std_logic; 
                q            : out std_logic
        );
end component;

REG_GEN : for I in 0 to D'RANGE generate
    ff_d_inst : ff_d
        Port Map( 
            reset => reset,
            clk   => clk,

            d     =>D(I),     
            q     =>Q(I)
        );
    end generate





    
