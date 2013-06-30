# Read about factories at https://github.com/thoughtbot/factory_girl

FactoryGirl.define do
  factory :csp_report_csp_report, :class => 'CspReport' do
    document_uri "MyString"
    referrer "MyString"
    blocked_uri "MyString"
    violated_directive "MyString"
    original_policy "MyString"
  end
end
