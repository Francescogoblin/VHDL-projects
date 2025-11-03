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
                reset        : in std_logic;
                clk          : in std_logic;

                d            : in std_logic;
                q            : out std_logic
        );
        end component; 
