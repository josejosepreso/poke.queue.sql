create or alter PROCEDURE pokequeue.create_poke_request(
    @type NVARCHAR(255)
)
AS 

SET NOCOUNT ON;

insert into pokequeue.requests(
    [type]
    , [url]
    , id_status
) values(
    @type
    , ''
    , ( select id from pokequeue.status where description = 'sent' )
)

select max(id) as id, 'insert' as 'action' from pokequeue.requests;
