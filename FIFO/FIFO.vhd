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
    
    din   : in std_logic_vector(FIFO_WIDTH-1 DOWNTO 0);
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

--IDEA: la memoria è una serie di registri lunga FIFO_DEPTH che posso nel creare con un process. In questa memoria sono memorizzati i valori ( din ) che sono std_logic_vector,  e anche la loro posizione. 
--Quindi creo un tipo personalizzato che contiene il valore ( din ) e un numero ( integer? o std_logic) che va da 0 a 15 che corrisponde alla posizione attuale dell registro nella memoria in cui si trova il dato
--Come ultima cosa tratto empty e full
--

architecture Behavioral of FIFO is

  type nuovotipo is record
    dato      : std_logic_vector type;
    posizione : integer type:
  end record nuovotipo;



begin







end Behavioral;
