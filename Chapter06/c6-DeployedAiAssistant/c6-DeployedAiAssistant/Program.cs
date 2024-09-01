using OllamaSharp;
using OllamaSharp.Models.Chat;

var builder = WebApplication.CreateBuilder(args);

// Add services to the container.
builder.Services.AddEndpointsApiExplorer();
builder.Services.AddSwaggerGen();

builder.Services.AddSingleton(sp =>
    new OllamaApiClient(new Uri("http://localhost:11434")));

var app = builder.Build();

// Configure the HTTP request pipeline.
if (app.Environment.IsDevelopment())
{
    app.UseSwagger();
    app.UseSwaggerUI();
}

app.UseHttpsRedirection();

app.MapGet("/ask-question", async (string question, OllamaApiClient ollamaClient) =>
{
    var chat = await ollamaClient.Chat(new ChatRequest()
    {
        Model = "llama3.1",
        Messages = new List<Message>
        {
           new Message(ChatRole.User, question)
        }
    });
    return Results.Content(chat.Message.Content);
});

app.Run();
