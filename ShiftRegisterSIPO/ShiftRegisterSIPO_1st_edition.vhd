library IEEE;
use IEEE.STD_LOGIC_1164.ALL;


entity ShiftRegisterSIPO is
    Generic(
        SR_WIDTH : integer := 4
    );
    
    Port(
        reset       : in std_logic;
        clk         : in std_logic;
        
        data_in     : in std_logic;
        data_out    : out std_logic_vector(SR_WIDTH-1 DOWNTO 0)
    );
end ShiftRegisterSIPO;


architecture Behavioral of ShiftRegisterSIPO is

        component ff_d is
            Port (
            
                d        : in std_logic;
                q        : out std_logic;
                
                clk      : in std_logic;
                reset    : in std_logic
                
            );
        end component;
        
        signal n : std_logic_vector(SR_WIDTH-1 DOWNTO 0);      --   CREO UN SEGNALE N LUNGO 4

begin

    COND_OK : if SR_WIDTH > 1 generate  -- QUANDO LA LUNGHEZZA DEL REGISTRO DA CREARE E' MAGGIORE DI 1 ( AD ESEMPIO SR_WIDTH = 4)
    
            ff_d_inst_0 : ff_d          -- CREAZIONE DEL REGISTRO PIU' A SINSITRA
            Port Map (
                d => data_in,    -- A D ASSEGNO DATA IN
                q => n(0),       -- L'USCITA DEL PRIMO REGISTRO E' IL PRIMO BIT DEL SEGNALE
                
                clk => clk,
                reset => reset
            );
    
        LOOP_int : for I in 0 to SR_WIDTH-2 generate     -- DOPODICHE' GENERO I RESTANTI 3 FLIP FLOP ( CON I=0, I=1, I=2)
        
            ff_d_inst : ff_d
            Port Map (
                d => n(I),        --  A D ASSEGNO N(0) CHE ERA L'USCITA DI QUELLO PRIMA
                q => n(I+1),      --  A Q ASSEGNO N(1) 
                
                clk => clk,
                reset => reset
            );
            
            
        end generate;
        
        data_out <= n;  -- SVUOTO TUTTO IL VETTORE N IN DATA OUT
    
     end generate;
   
