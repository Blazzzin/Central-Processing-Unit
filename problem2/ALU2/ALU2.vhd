library ieee;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_unsigned.all;
use IEEE.numeric_std.all;

entity ALU2 is
    port (
        Clock : in std_logic;
        A, B : in unsigned(7 downto 0);
        OP : in unsigned(15 downto 0);
        Neg : out std_logic;
        R1 : out unsigned(3 downto 0);
        R2 : out unsigned(3 downto 0)
    );
end ALU2;

architecture calculation of ALU2 is
    signal Result : unsigned(7 DOWNTO 0) := (others => '0');

begin
    Process (Clock, OP, A, B, Result)
    begin
        if (rising_edge(Clock)) then
            case OP is
                when "1000000000000000" => -- increment A by 2
                    Result <= A + 2;
                    Neg <= '0';
                when "0100000000000000" => -- Shift B right by two bits
                    Result <= shift_right(B, 2);
                    Neg <= '0';
                when "0010000000000000" => -- shift A right by four bits
                    Result <= shift_right(A, 4);
                    Neg <= '0';
                when "0001000000000000" => -- Min(A and B)
                    if (A < B) then
                        Result <= A;
                        Neg <= '0';
                    else
                        Result <= B;
                        Neg <= '0';
                    end if;
                when "0000100000000000" => -- Rotate A right by two bits (ROR)
                    Result <= A ROR 2;
                    Neg <= '0';
                when "0000010000000000" => -- Invert the bit significance order of B
                    Result <= B(0) & B(1) & B(2) & B(3) & B(4) & B(5) & B(6) & B(7);
                    Neg <= '0';
                when "0000001000000000" => -- XOR A and B
                    Result <= (A xor B);
                    Neg <= '0';
                when "0000000100000000" => -- Summation of A and B then decrease it by 4
                    Result <= ((A + B) - 4);
                    Neg <= '0';
                when "0000000010000000" => -- All the high bits on the output
                    Result <= "11111111";
                    Neg <= '0';
                when others =>
                    Result <= "00000000";
            end case;
        end if;
    end process;

    R1 <= Result(3 downto 0);
    R2 <= Result(7 downto 4);

end calculation;
