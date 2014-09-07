library ieee;
use ieee.std_logic_1164.all;
entity adder8 is
    port
    (      
        op        :in std_logic_vector(2 downto 0); --Operação
        a, b      :in std_logic_vector (7 downto 0);        

        carry_out :out std_logic; --Flag Carry out
        negative  :out std_logic; --Flag Negativo
        zero      :out std_logic; --Flag Zero
        overflow  :out std_logic; --Flag Overflow
        s         :out std_logic_vector (7 downto 0)
    );
end adder8;

architecture adder08 of adder8 is
    signal carry_in:  std_logic; 
    signal c:         std_logic_vector(1 downto 0);
    signal output:    std_logic_vector(7 downto 0) := (others => '0');
    signal this_a:    std_logic_vector(7 downto 0) := (others => '0');
    signal this_b:    std_logic_vector(7 downto 0) := (others => '0');
begin
    Logic:process(a, b, output)
    begin
        case op is
            when "100"  => s <= not a;  --COMP
            when "101"  => s <= a or b; --OR
            when "110"  => s <= a xor b;--XOR
            when "111"  => s <= a and b;--AND
            when others => s <= output; --DEFAULT
				end case;
    end process Logic;
    Arithmetic: process(this_a, this_b)

    begin
        if(op = "000") then    --SUB
            --TIRAR ESSA DÚVIDA
            this_b   <= not b(7 downto 0);
            carry_in <= '1';
        elsif(op = "010") then --MULT 2
            carry_in <= '0';
            this_b   <= a(7 downto 0);
        elsif(op = "010") then --INC
            carry_in <= '0';
            this_b <= "00000001";
        else                   --SUM 
            carry_in <= '0';
        end if;

    end process Arithmetic;


    A0: entity work.Adder4
        port map( cin => carry_in , a => a(3 downto 0), b =>this_b(3 downto 0), cout => c(0), s=>s(3 downto 0));
    A1: entity work.Adder4
        port map( cin => carry_in , a => a(7 downto 4), b =>this_b(7 downto 4), cout => c(1), s=>s(7 downto 4));
    
    carry_out <= c(1);
    zero      <= not(output(0) or output(1) or output(2) or output(3) or output(4) or output(5) or output(6) or output(7));
    negative  <= output(7);
    overflow  <= '1' when (output(7) = '1' and a(7) = '0'  and b(7) = '0' and op = "001") or
													(output(7) = '0' and a(7) = '1'  and b(7) = '1' and op = "001") or
													(output(7) = '1' and a(7) = '1'  and b(7) = '0' and op = "000") or 
													(output(7) = '0' and a(7) = '0'  and b(7) = '1' and op = "000") or
													c(1) = '1'
                     else '0';
end adder08;
