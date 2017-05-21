require 'rails_helper'

RSpec.describe TasksController, type: :controller do
  describe '.index' do
    # let(:task1) { FactoryGirl.create :task1 }
    # let(:task2) { FactoryGirl.create :task2 }

    it 'successfully returns the index page' do
      # task1 = FactoryGirl.create(:task)
      # Rails.logger.info @task1
      # task2 = FactoryGirl.create(:task)
      # Rails.logger.info @task2
      # task1.update_attributes(title: 'Something else')
      # Rails.logger.info @task1
      get :index
      expect(response).to have_http_status :success
      response_value = ActiveSupport::JSON.decode(@response.body)
      expect(response_value.count).to eq(2)
      response_ids = response_value.collect do |task|
        task['id']
      end
      expect(response_ids).to eq([task1.id, task2.id])
    end

    # it 'responds with the two created test tasks' do
    #   # task1 = FactoryGirl.create(:task)
    #   # task2 = FactoryGirl.create(:task)
    #   response_value = ActiveSupport::JSON.decode(@response.body)
    #   expect(response_value.count).to eq(2)
    # end
  end

  describe '.update' do
    # let(:task) { FactoryGirl.create :task }
    it 'marks tasks as done' do
      task = FactoryGirl.create(:task)
      put :update, params: { id: task.id, task: { done: true } }
      expect(response).to have_http_status(:success)
      task.reload
      expect(task.done).to eq(true)
    end
  end
end
