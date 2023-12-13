module ApplicationHelper
  def errors_for(form, field)
    debugger if filed = :zip_code
    tag.p(form.object.errors[field].try(:first), class: 'invalid-feedback')
  end
end
