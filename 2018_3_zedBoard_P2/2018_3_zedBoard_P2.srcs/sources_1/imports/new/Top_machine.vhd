----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 05.11.2023 19:40:39
-- Design Name: 
-- Module Name: Top_machine - Behavioral
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

entity TOP_Level is
    Port ( RESET,ENTER,TOP_CLOCK : in STD_LOGIC;
           NUMBER : in STD_LOGIC_VECTOR (7 DOWNTO 0);
           OUTPUT : out STD_LOGIC_VECTOR (7 DOWNTO 0));
end TOP_Level;

architecture Behavioral of TOP_Level is
component contador
Port ( INPUT : in STD_LOGIC;
       OUTPUT: out STD_LOGIC);
end component;
component ProcessingUnit
Port ( A,B : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
       CLOCK,ENTER,RESET: IN STD_LOGIC;
       FINAL: OUT STD_LOGIC;
       MCD : OUT STD_LOGIC_VECTOR (7 DOWNTO 0));
end component;
component Antirebotes 
Port ( INPUT : IN STD_LOGIC;
       CLOCK,CONT : IN STD_LOGIC;
       OUTPUT : OUT STD_LOGIC);
end component;
signal s_enter,s_reset,s_count,s_final: std_logic;
signal s_output:std_logic_vector(7 downto 0);
begin
U_Process: ProcessingUnit port map(NUMBER,NUMBER,TOP_CLOCK,s_enter,s_reset,s_final,s_output);
U_Antirebote_enter: Antirebotes port map (ENTER,TOP_CLOCK,s_count,s_enter);
U_Antirebote_reset: Antirebotes port map (RESET,TOP_CLOCK,s_count,s_reset);
U_contador: contador port map (TOP_CLOCK,s_count);

Signal_selection: Process(s_final,s_output,NUMBER) is

begin
    if s_final= '0' then 
        OUTPUT<=s_output;
    else
        OUTPUT<= NUMBER; 
    end if; 
end process;


end Behavioral;
