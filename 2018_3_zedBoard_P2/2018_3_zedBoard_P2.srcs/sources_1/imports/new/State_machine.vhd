----------------------------------------------------------------------------------
-- Company: 
-- Engineer: 
-- 
-- Create Date: 30.10.2023 19:05:53
-- Design Name: 
-- Module Name: State_machine - Behavioral
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

entity State_machine is
    Port ( ENTER,CERO,SIGNO,RESET: in std_logic;
           CLOCK: in std_logic;
           WRA,WRB,SEL,FINAL: out std_logic);
end State_machine;

architecture Behavioral of State_machine is
type state_mach is (write_a,enter_a,write_b,enter_b,opera,aa,bb,fin, reset_pressed,reset_release);
signal state: state_mach;
begin
Process(CLOCK, RESET)
begin
    if RESET='1' then
        state<=write_a;
    else 
        if (CLOCK'event and CLOCK='1') then 
            case state is 
                   when write_a => 
                        if ENTER= '1' then 
                            state<= enter_a;
                        else
                            state<= write_a;
                        end if;
                   when enter_a => 
                        if ENTER= '0' then 
                            state<= write_b;
                        else
                            state<= enter_a;
                        end if;
                   when write_b => 
                        if enter= '1' then 
                            state<= enter_b;
                        else
                            state<= write_b;
                        end if;
                   when enter_b => 
                        if enter= '0' then 
                            state<= opera;
                        else
                            state<= enter_b;
                        end if;
                   when opera => 
                        if cero='0' and signo='0' then 
                            state<= bb;
                        elsif cero='0' and signo='1' then
                            state<= aa;
                        elsif cero='1' then
                            state<= fin;
                        end if;
                   when aa=> 
                        state<=opera;
                   when bb=>
                        state<=opera;
                   when fin => 
                        if ENTER= '1' then 
                            state<= reset_pressed;
                        else
                            state<= fin;
                        end if;
                   when reset_pressed => 
                        if ENTER= '0' then 
                            state<= reset_release;
                        else
                            state<= reset_pressed;
                        end if;
                    when reset_release =>
                        state<=write_a;
                    end case;
        end if;
    end if;                
end process;
with state select 
    WRA<= '1' when aa,
          '1' when enter_a,
          '0' when write_b,
          '0' when OTHERS;

with state select 
    WRB<= '1' when bb,
          '1' when enter_b,
          '0' when opera,
          '0' when OTHERS;
          
with state select 
    SEL<= '1' when aa,
          '1' when bb,
          '1' when opera,  
          '0' when OTHERS;
          
with state select 
    FINAL<= '1' when fin,  
            '0' when OTHERS;
          
end Behavioral;
