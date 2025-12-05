Library IEEE;
use IEEE.std_logic_1164.all ;

entity FIFO is
  
  Generic(
    FIFO_WIDTH : integer := 8;
    FIFO_DEPTH : integer := 16
    );

  Port(
    reset : in std_logic;
    clk   : in std_logic;
    
    din   : in  std_logic_vector(FIFO_WIDTH-1 DOWNTO 0);
    dout  : out std_logic_vector(FIFO_WIDTH-1 DOWNTO 0); --parola in uscita
    
    rd_en : in std_logic; --quando espellere
    wr_en : in std_logic; --quando memorizzare
    full  : out std_logic; --quando memoria piena ( non posso memorizzare)
    empty : out std_logic  --quando memoria vuota ( non posso espellere ) 
    );

end FIFO;

--tips : Costruire la FIFO partendo da una memoria creata tramite un tipo personalizzato.
--tips : Tenere traccia di dove scrivere e leggere tramite due «signal» che verranno usati come puntatori.
--tips : Tenere traccia di quanti elementi sono stati immagazzinati tramite un signal.
--tips : Alcune cose è utile farle sincrone altre no.
--tips : Provare a farlo sia senza che con variabili per capire come possono modificare lo stile di scrittura

architecture Behavioral of FIFO is

 type nuovotipo IS ARRAY (0 TO  FIFO_DEPTH - 1) of  std_logic_vector (din'RANGE);

    signal memoria    : nuovotipo := (Others => (Others => '0'));
    signal p_mem : integer := 0;  --dove inserire il prossimo dato
    signal p_esp      : integer := 0;  --da dove leggere il prossimo dato
    signal cont       : integer := 0;

begin
    process ( clk , reset )
      begin
        if reset = 1 then
          dout <= (Others =>0);
          cont <= 0;
          p_mem <= 0;
          p_esp  <= 0;

        elsif rising_edge(clk) = 1 then

           if re_en = '1' and cont /= '0' then
            dout <= memoria(p_esp);
            cont = cont - 1;                                                          
            p_esp = p_esp + 1;
                                                                     
              if p_esp = FIFO_DEPTH then
                p_esp = 0  ;
              end if;                                                        
                                                                      
          elsif we_en = '1'  and cont /= FIFO_DEPTH then
            memoria(p_mem) <= din;
            cont = cont + 1;
            p_mem = p_mem  +1;
                                                                      
              if p_mem = FIFO_DEPTH then
                p_mem = 0  ;
              end if;
                                                                        
          end if;       
        end if;                                                              
    
                                                                  






end Behavioral;
