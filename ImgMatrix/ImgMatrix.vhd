library IEEE;
use IEEE.std_logic.ALL; 
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

Architecture Behavioral of img_matrix is : 
