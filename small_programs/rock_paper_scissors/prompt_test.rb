def test_method
  prompt('test message')
end

def prompt(message)
  Kernel.puts("=>#{message}")
end
