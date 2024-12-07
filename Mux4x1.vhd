LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Mux4X1 IS
    PORT(
        I : IN  STD_LOGIC_VECTOR(3 DOWNTO 0);
        S : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
        O : OUT STD_LOGIC
    );
END Mux4X1;

ARCHITECTURE Behavior OF Mux4X1 IS
BEGIN
    PROCESS(I, S)
    BEGIN
        CASE S IS
            WHEN "00" => O <= I(0);
            WHEN "01" => O <= I(1);
            WHEN "10" => O <= I(2);
            WHEN "11" => O <= I(3);
            WHEN OTHERS => O <= 'Z';
        END CASE;
    END PROCESS;
END Behavior;
