When /^(?:|I )click the dialog's Ok button?$/ do
  with_scope('.ui-dialog') do
    click_button("[@class='ui-button-text']")
  end
end
