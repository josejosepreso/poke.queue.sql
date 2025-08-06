create or alter procedure pokequeue.delete_poke_request(
	@id int
)
as
begin
	set NOCOUNT on;

	if not exists(select 1 from pokequeue.requests where id = @id)
		begin
			select 1 as not_found;
			return;
		end

	delete from pokequeue.requests where id = @id;
	select @id as id, 'delete' as 'action';
end;
