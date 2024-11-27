LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

ENTITY Decoder2x4 IS
    PORT(
        I    : IN  STD_LOGIC_VECTOR(1 DOWNTO 0);
        O    : OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
    );
END Decoder2x4;

ARCHITECTURE Behavior OF Decoder2x4 IS
BEGIN
    PROCESS(I)
    BEGIN
        CASE I IS
            WHEN "00" =>
                O <= "0001";
            WHEN "01" =>
                O <= "0010";
            WHEN "10" =>
                O <= "0100";
            WHEN "11" =>
                O <= "1000";
            WHEN OTHERS =>
                O <= "0000";
        END CASE;
    END PROCESS;
END Behavior;
