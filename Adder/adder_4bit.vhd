library IEEE;
    use IEEE.std_logic_1164.all;
    
entity adder_4bit is
    Port(
       a     :   in  std_logic_vector ( 3 DOWNTO 0);
       b     :   in  std_logic_vector ( 3 DOWNTO 0);
       sum   :   out  std_logic_vector ( 3 DOWNTO 0)
       );
end adder_4bit;

architecture Behavioral of adder_4bit is

    signal  s0  :   std_logic;
    signal  s1  :   std_logic;
    signal  s2  :   std_logic;

    component half_adder is
    Port(
       a       : in  std_logic;
       b       : in  std_logic;
       sum     : out std_logic;
       c       : out std_logic
     ); 
     end component;
     
     component full_adder is
  Port (
     a_fa      : in    std_logic; 
     b_fa      : in    std_logic;
     c_in_fa   : in    std_logic; --bit del resto precedente
     sum_fa    : out   std_logic;
     c_out_fa  : out   std_logic  -- bit del resto adesso
       );
      end component;
        
begin

    adder_inst_1  :  half_adder
    
      Port map(
        a   => a(0),
        b   => b(0),
        c   => s0,
        sum => sum(0)
        );
       
    adder_inst_2  : full_adder
    
      Port map(
        a_fa      => a(1),
        b_fa      => b(1),
        c_in_fa   => s0,
        sum_fa    => sum(1),
        c_out_fa  => s1
        );
        
    adder_inst_3  : full_adder
    
      Port map(
        a_fa      => a(2),
        b_fa      => b(2),
        c_in_fa   => s1,
        sum_fa    => sum(2),
        c_out_fa  => s2
        );
        
     adder_inst_4  : full_adder
    
      Port map(
        a_fa      => a(3),
        b_fa      => b(3),
        c_in_fa   => s2,
        sum_fa    => sum(3),
        c_out_fa  => open
        );
        
        
   
end Behavioral;
