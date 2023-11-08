----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 10.10.2023 14:08:58
-- Design Name: 
-- Module Name: ALU_1_bit - Behavioral
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

entity ALU_1_bit is
    Port ( A : in STD_LOGIC;
           B : in STD_LOGIC;
           CIN : in STD_LOGIC;
           SIGN : in STD_LOGIC;
           OPERA : in STD_LOGIC_vector(1 downto 0);
           COUT : out STD_LOGIC;
           RESULT : out STD_LOGIC);
end ALU_1_bit;

architecture Behavioral of ALU_1_bit is
component XOR2 
    port( 
             A,B: in std_logic;
             O : out std_logic);
end component;
component FA
    port(
        A,B,CIN: in std_logic;
        COUT,RESULT: out std_logic);
end component;
signal s_sumres:std_logic;
signal s_xor2FA:std_logic;
signal s_f_opera:std_logic;
signal s_result:std_logic;
signal s_max,s_min,s_sign: std_logic;
begin
s_f_opera<= opera(0) or opera(1);
xor2_u1: xor2 port map (A=>B,B=>s_f_opera,O=>s_xor2FA);
fa_u1: fa port map (A=>A, B=>s_xor2FA, CIN=>CIN, COUT=>COUT,RESULT=>s_sumres);
s_sign<=sign;
mux_max: process(A,B,s_sign)
    begin
    if s_sign = '0' then 
        s_max<=B;
    elsif s_sign='1'then
        s_max<=A;
    end if;
end process; 
mux_min: process(A,B,s_sign)
    begin
    if s_sign = '0' then 
        s_min<=A;
    elsif s_sign='1'then
        s_min<=B;
    end if;
end process; 
logic_unit: process(opera,s_min,s_max,s_sumres,sign)
    begin
        if opera="00" or opera= "01" then 
            s_result<=s_sumres;
--            s_sign<=sign;
        elsif opera = "10" then
            s_result<=s_max;
--            s_sign<=sign;
        elsif opera="11" then 
            s_result<=s_min;
--            s_sign<=sign;
        end if;      
              
end process;

RESULT<=s_result;

end Behavioral;
