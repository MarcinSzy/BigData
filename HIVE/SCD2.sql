merge into contacts_target
using (
  -- The base staging data.
  select
    contacts_update_stage.id as join_key,
    contacts_update_stage.* from contacts_update_stage

  union all

  -- Generate an extra row for changed records.
  -- The null join_key means it will be inserted.
  select
    null, contacts_update_stage.*
  from
    contacts_update_stage join contacts_target on contacts_update_stage.id = contacts_target.id
  where
    ( contacts_update_stage.email <> contacts_target.email or contacts_update_stage.state <> contacts_target.state )
    and contacts_target.valid_to is null
) sub
on sub.join_key = contacts_target.id
when matched
  and sub.email <> contacts_target.email or sub.state <> contacts_target.state
  then update set valid_to = current_date()
when not matched
  then insert values (sub.id, sub.name, sub.email, sub.state, current_date(), null);