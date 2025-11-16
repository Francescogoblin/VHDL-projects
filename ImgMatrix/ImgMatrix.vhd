library IEEE;
use IEEE.STD_LOGIC_1164.ALL; 
use IEEE.NUMERIC_STD.ALL; 

entity img_matrix is
  Generic(
    IMG_DIM_POW2 : integer :=2
    );
  Port(
      clk      : in std_logic;
      reset    : in std_logic;

      in_red      : in std_logic_vector(7 DOWNTO 0);
      in_green    : in std_logic_vector(7 DOWNTO 0);
      in_blue     : in std_logic_vector(7 DOWNTO 0);
      in_x_addr   : in std_logic_vector(IMG_DOM_POW2 -1 DOWNTO 0);
      in_y_addr   : in std_logic_vector(IMG_DOM_POW2 -1 DOWNTO 0);

      out_gray    : out std_logic_vector(7 DOWNTO 0);
      out_x_addr  : in std_logic_vector(IMG_DOM_POW2 -1 DOWNTO 0);
      out_y_addr  : in std_logic_vector(IMG_DOM_POW2 -1 DOWNTO 0);
    );
end img_matrix;

architecture Behavioral of img_matrix is 
  
component my_register_with_process is
  
	Port(
		reset	: in  std_logic;
		clk		: in  std_logic;

		D	          : in  std_logic_vector(7 DOWNTO 0);
		Q 	        : out std_logic_vector(7 DOWNTO 0)
	);
end component;

  signal gray_in : std_logic_vector ( 7 DOWNTO 0)

  type matrix_type is array (0 to (2**IMG_DIM_POW2)-1 , 0 to (2**IMG_DIM_POW2)-1)   of std_logic_vector ( 7 DOWNTO 0 ) ;

  signal mat_in , mat_out : matrix_type;

  signal in_x_addr_int, in_y_addr_int, out_x_addr_int, out_y_addr_int : integer;
  
begin

  in_x_addr_int <= to_integer(unsigned(in_y_add));
  in_yaddr_int <= to_integer(unsigned(in_y_add));
  out_x_addr_int <= to_integer(unsigned(out_x_add));
  out_yaddr_int <= to_integer(unsigned(out_y_add));

  gray_in <= std_logic_vector(unsigned(in_red) + unsigned(in_green) + unisgned(in_blue))/3;

  row_gen : for I in 0 to (2**IMG_DIM_POW2)-1 generate
    col_gen : for J in 0 to (2**IMG_DIM_POW2)-1 generate

      reg_pr_inst : reg_pr 
        Port Map ( 
          clk   => clk
          reset => clk
          D     => mat_in  ( I , J )
          Q     => mat_out ( I , J )
          );

        mat_in (I , J ) <= gray_in when in_x_addr_int = I and in_y_addr_int = J else
                           mat_out(I,J);
    end generate;
  end generate;

  gray_out <= mat_out(out_x_addr_int , out_y_addr_int) ; 

  process ( clk, reset)   -- ora instanzio il registro con un process invece di farlo con una GEN
  begin 
     if reset = '1' then
       out_gray <= ( Others => '0');
     elsif rising_edge(clk) then
       out_gray <= gray_out;
    end if;
  end process;

  

end Behavioral;
