create or alter PROCEDURE pokequeue.create_poke_request(
    @type NVARCHAR(255),
    @sample_size INT = NULL
)
AS 

SET NOCOUNT ON;

insert into pokequeue.requests(
    [type]
    , [url]
    , id_status
    , sample_size
) values(
    @type
    , ''
    , ( select id from pokequeue.status where description = 'sent' )
    , @sample_size
)

select max(id) as id, 'insert' as 'action' from pokequeue.requests;
