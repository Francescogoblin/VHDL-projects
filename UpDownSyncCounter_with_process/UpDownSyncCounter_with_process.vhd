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

signal addendo : signed (0 TO 1);                  
signal reg_out : std_logic_vector(count'RANGE);   
signal reg_in  : std_logic_vector(count'RANGE);

begin

--addendo <= to_signed(1 , 2 )  when inc_count = '1' and dec_count = '0' else   
--          to_signed(-1, 2 )  when inc_count = '0' and dec_count = '1' else  
--          to_signed(0 , 2 ) ;

    process (clk, reset)
      begin
      
          if reset ='1' then
          
              reg_out  <= (Others => '0');
          
          elsif rising_edge(clk) then
          
              if (inc_count = '1' and dec_count = '0') then
                     addendo <= to_signed(1, 2);
              elsif (inc_count = '0' and dec_count = '1') then
                     addendo <= to_signed(-1, 2);
              else
                     addendo <= to_signed(0, 2);
              end if;
              
              reg_out <= reg_in;
              reg_in <= std_logic_vector(addendo + signed(reg_out));  
              
          end if;
          
        count <= reg_out;
          
    end process;


end Behavioral;
