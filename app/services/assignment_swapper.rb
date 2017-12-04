class AssignmentSwapper
  def call(assignment_ids)
    assignment1 = Assignment.find(assignment_ids.first)
    assignment2 = Assignment.find(assignment_ids.second)

    employee1 = assignment1.employee
    employee2 = assignment2.employee

    Assignment.transaction do
      assignment1.update!(employee: employee2)
      assignment2.update!(employee: employee1)
    end
  end
end