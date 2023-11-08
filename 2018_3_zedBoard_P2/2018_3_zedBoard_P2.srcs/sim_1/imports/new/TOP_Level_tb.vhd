----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 07.11.2023 15:36:58
-- Design Name: 
-- Module Name: TOP_Level_tb - Behavioral
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

entity TOP_Level_tb is
--  Port ( );
end TOP_Level_tb;

architecture Behavioral of TOP_Level_tb is
component TOP_Level is
      Port ( RESET,ENTER,TOP_CLOCK : in STD_LOGIC;
           NUMBER : in STD_LOGIC_VECTOR (7 DOWNTO 0);
           OUTPUT : out STD_LOGIC_VECTOR (7 DOWNTO 0));
end component;
signal s_reset,s_enter,s_top_clock:std_logic;
signal s_number: std_logic_vector(7 downto 0);
signal s_output: std_logic_vector(7 downto 0);
begin
UUT: TOP_Level port map( s_reset,s_enter,s_top_clock,s_number,s_output);
General_clock: process
begin
    while true loop
        s_top_clock<='0';
        wait for 5 ns;
        s_top_clock<='1';
        wait for 5 ns;
        end loop;
end process;

process
begin
    s_number<="00001100";
    wait for 100 ms;
    s_enter<='1';
    wait for 100 ms;
    s_enter<='0';
    wait for 100 ms;
    
    s_reset<='1';
    wait for 100 ms;
    s_reset<='0';
    wait for 100 ms;
    
    s_number<="00011100";
    wait for 100 ms;
    s_enter<='1';
    wait for 100 ms;
    s_enter<='0';
    wait for 100 ms;
    s_number<="00000010";
    wait for 100 ms;
    s_enter<='1';
    wait for 100 ms;
    s_enter<='0';
--    wait for 100 ms;
--    --Aqui se verá el resultado de la primera operación
--    wait for 100 ms; 
--    -- Pasamos a la segunda operacion
--    s_reset<='1';
--    wait for 100 ms;
--    s_reset<='0';
--    wait for 100 ms;
--    -- fin del reseteo
    
--    s_number<="00010101";
--    wait for 100 ms;
--    s_enter<='1';
--    wait for 50 ms;
--    s_enter<='0';
--    wait for 100 ms;
    
    
--    s_number<="00001110";
--    wait for 100 ms;
--    s_enter<='1';
--    wait for 100 ms;
--    s_enter<='0';
--    wait for 100 ms;
--    -- segunda operacion
--    wait for 100 ms; 
    
--    s_reset<='1';
--    wait for 100 ms;
--    s_reset<='0';
--    wait for 100 ms;

end process;

end Behavioral;
