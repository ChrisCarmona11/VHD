----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 18.10.2023 16:13:43
-- Design Name: 
-- Module Name: Multi6x7 - Behavioral
-- Project Name: 
-- Target Devices: 
-- Tool Versions: 
-- Description: 
-- 
-- Dependencies: 
-- 
-- Revision:
-- Revision 0.01 - File Created
-- Additional Comments:
-- 
----------------------------------------------------------------------------------


library IEEE;
use IEEE.STD_LOGIC_1164.ALL;

-- Uncomment the following library declaration if using
-- arithmetic functions with Signed or Unsigned values
--use IEEE.NUMERIC_STD.ALL;

-- Uncomment the following library declaration if instantiating
-- any Xilinx leaf cells in this code.
--library UNISIM;
--use UNISIM.VComponents.all;

entity Multi6x7 is
    GENERIC( COLS: INTEGER:=6;
             ROWS: INTEGER:=7);
    Port ( A : in STD_LOGIC_VECTOR (cols-1 downto 0);
           B : in STD_LOGIC_VECTOR (rows-1 downto 0);
           RESULT : OUT STD_LOGIC_VECTOR (cols+rows-1 downto 0));
end Multi6x7;

architecture Behavioral of Multi6x7 is
COMPONENT MULTIPLIC_1
    Port ( pin : in STD_LOGIC;
           a : in STD_LOGIC;
           b : in STD_LOGIC;
           cin : in STD_LOGIC;
           pout : out STD_LOGIC;
           cout : out STD_LOGIC);
END COMPONENT; 

type bit_matrix is array (COLS-1 downto 0,ROWS-1 downto 0) of std_logic;
signal matrix_pout,matrix_cout: bit_matrix;
signal s_result:std_logic_vector(COLS+ROWS-1 downto 0);

begin
FILAS: FOR i in 0 to ROWS-1 generate
    COLUMNAS: FOR j in 0 to COLS-1 generate 
        ESQUINA_TOP_RIGHT: if (i=0) and (j=0) generate
            multi: MULTIPLIC_1 port map (pin=>'0',a=>a(j),b=>b(i),cin=>'0',
            pout=>matrix_pout(j,i),cout=>matrix_cout(j,i));
            S_RESULT(i+j)<=matrix_pout(j,i);        
            end GENERATE;
        ULTIMA_COLUMNA: if (i>0) and (j = 0) generate
            multi: MULTIPLIC_1 port map (pin=>matrix_pout(j+1,i-1),a=>a(j),b=>b(i),cin=>'0',
            pout=>matrix_pout(j,i),cout=>matrix_cout(j,i));
            S_RESULT(i+j)<=matrix_pout(j,i);        
            end GENERATE;
        PRIMERA_COLUMNA: if (i>0) and (j = COLS-1) and (i<ROWS-1) generate
            multi: MULTIPLIC_1 port map (pin=>matrix_pout(j,i-1),a=>a(j),b=>b(i),cin=>matrix_cout(j-1,i),
            pout=>matrix_pout(j,i),cout=>matrix_cout(j,i));
            end GENERATE;
        PRIMERA_FILA: if (i=0)and (j>0) generate
            multi: MULTIPLIC_1 port map (pin=>'0',a=>a(j),b=>b(i),cin=>matrix_cout(j-1,i),
            pout=>matrix_pout(j,i),cout=>matrix_cout(j,i));
            end GENERATE;
        ULTIMA_FILA: if (i = ROWS-1) and (j>0) and (j<COLS-1) generate
            multi: MULTIPLIC_1 port map (pin=>matrix_pout(j+1,i-1),a=>a(j),b=>b(i),cin=>matrix_cout(j-1,i),
            pout=>matrix_pout(j,i),cout=>matrix_cout(j,i));
            S_RESULT(i+j)<=matrix_cout(j,i);        
        end GENERATE;
        ESQUINA_BOTTON_LEFT: if (i = ROWS-1) and (j=COLS-1) generate
            multi: MULTIPLIC_1 port map (pin=>matrix_cout(j,i-1),a=>a(j),b=>b(i),cin=>matrix_cout(j-1,i),
            pout=>matrix_pout(j,i),cout=>matrix_cout(j,i));
            S_RESULT(i+j)<=matrix_pout(j,i);
            S_RESULT(i+j+1)<=matrix_cout(j,i);     
        end GENERATE;
        RESTO: if (i>0) and (i<ROWS-1) and (j>0) and (j<COLS-1) generate
             multi: MULTIPLIC_1 port map (pin=>matrix_pout(j+1,i-1),a=>a(j),b=>b(i),cin=>matrix_cout(j-1,i),
             pout=>matrix_pout(j,i),cout=>matrix_cout(j,i));
        end generate;
        END generate;
END generate;


RESULT<=s_result;
end Behavioral;

