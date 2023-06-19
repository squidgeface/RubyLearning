class Node 
    def initialize(name:)
        @name = name
        @connections = []
    end

    def name
        @name
    end

    def add_connection(connection:)
        @connections.push(connection)
    end

    def connections
        @connections
    end

    def get_connection_by_name(name: )
        out_node = nil
        connections.each do |node|
            if name == node.name
                out_node = node
                break
            end
        end
        out_node
    end

    def get_connections_strings
        names = connections.map do |node| 
            node.name 
        end
        names.join(", ")
    end
end