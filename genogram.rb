require "./node"

is_running = true
available_commands = ["exit", "link", "traverse", "inspect"]
nodes = []
puts "ruby genogram.rb"

# Create root node
puts "Enter a name for the root node:"
name = gets.chomp
# Root node
root_node = Node.new(name: name)
nodes.push (root_node)
current_node = root_node
puts "Root node created with name: #{root_node.name}"
# Loop commands until exit
 while is_running
     puts "Available commands: #{available_commands.join(", ")}"
     command = (gets.chomp).downcase
     case command
     when "exit"
         is_running = false
     when "link"
        puts "Enter a new name to link with #{current_node.name}"
        name = gets.chomp
        node_in_list = false
        nodes.each do |node|
            if (node.name == name)
                current_node.add_connection(connection: node)
                node.add_connection(connection: current_node)
                node_in_list = true
            end
        end
        if node_in_list == false
            new_node = Node.new(name: name)
            current_node.add_connection(connection: new_node)
            new_node.add_connection(connection: current_node)
            nodes.push(new_node)
        end
        puts "#{current_node.name} is now connected with #{current_node.get_connections_strings}"
     when "inspect"
        puts "Current node is #{current_node.name}"
        puts "#{current_node.name} is linked with #{current_node.get_connections_strings}" 
     when "traverse"
        puts "Choose a node to traverse to: (#{current_node.get_connections_strings})"
        current_node = current_node.get_connection_by_name(name: gets.chomp)
        puts "Current node changed to #{current_node.name}"
     end
 end