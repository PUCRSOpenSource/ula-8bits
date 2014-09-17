library ieee;
use ieee.std_logic_1164.all;
entity logic4 is
    port
    (
        a, b    :in   std_logic_vector(3 downto 0);
        op      :in   std_logic_vector(1 downto 0);
        s       :out  std_logic_vector(3 downto 0)
    );
end logic4;

architecture logic04 of logic4 is
begin
    L0: entity work.Logic2
        port map(a => a(1 downto 0), b => b(1 downto 0), op => op(1 downto 0), s => s(1 downto 0));
    L1: entity work.Logic2
        port map(a => a(3 downto 2), b => b(3 downto 2), op => op(1 downto 0), s => s(3 downto 2));
end logic04;
