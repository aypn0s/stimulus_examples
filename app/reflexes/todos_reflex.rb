class TodosReflex < ApplicationReflex
  before_reflex :set_params, only: [:create]

  def create
    Todo.create(@todo_params)
  end

  def delete(id)
    Todo.find(id).destroy
  end

  def toggle_done
    Todo.find(element.dataset.id).update(done: true)
  end

  def set_params
    @todo_params = params.require(:todo).permit!
  end
  # Add Reflex methods in this file.
  #
  # All Reflex instances expose the following properties:
  #
  #   - connection - the ActionCable connection
  #   - channel - the ActionCable channel
  #   - request - an ActionDispatch::Request proxy for the socket connection
  #   - session - the ActionDispatch::Session store for the current visitor
  #   - url - the URL of the page that triggered the reflex
  #   - element - a Hash like object that represents the HTML element that triggered the reflex
  #   - params - parameters from the element's closest form (if any)
  #
  # Example:
  #
  #   def example(argument=true)
  #     # Your logic here...
  #     # Any declared instance variables will be made available to the Rails controller and view.
  #   end
  #
  # Learn more at: https://docs.stimulusreflex.com
end
