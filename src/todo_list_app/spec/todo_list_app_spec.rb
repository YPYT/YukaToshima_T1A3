require_relative '../todo_list'
require_relative '../feedback'

descrive ToDoList do
    it 'should return the title with the date' do
        date = "4th April"
        todo_list = ToDoList.new(date)
        expect(todo_list.date).to eq(date)
    end
end