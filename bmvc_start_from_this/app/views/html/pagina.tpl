<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Currículo Profissional</title>
    <script src="https://cdn.tailwindcss.com"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.4.0/css/all.min.css">
    <style>
        .gradient-bg {
            background: linear-gradient(135deg, #3b82f6 0%, #8b5cf6 100%);
        }
        .card-hover:hover {
            transform: translateY(-5px);
            box-shadow: 0 20px 25px -5px rgba(0, 0, 0, 0.1), 0 10px 10px -5px rgba(0, 0, 0, 0.04);
        }
        .section-divider {
            border-top: 2px dashed #e5e7eb;
        }
    </style>
</head>
<body class="bg-gray-100 font-sans">
    <div class="container mx-auto px-4 py-8 max-w-4xl">
        <!-- Header -->
        <div class="gradient-bg text-white rounded-xl p-8 mb-8 shadow-lg">
            <div class="flex flex-col md:flex-row items-center">
                <div class="w-32 h-32 rounded-full bg-white flex items-center justify-center mb-4 md:mb-0 md:mr-8 shadow-md">
                    <i class="fas fa-user text-5xl text-blue-500"></i>
                </div>
                <div>
                    <h1 id="nome" class="text-3xl font-bold mb-2">Nome do Candidato</h1>
                    <div class="flex items-center mb-2">
                        <i class="fas fa-birthday-cake mr-2"></i>
                        <span id="idade" class="text-lg">Idade</span>
                    </div>
                    <div class="flex flex-wrap gap-2 mt-4">
                        <span class="bg-white text-blue-600 px-3 py-1 rounded-full text-sm font-semibold">Profissional</span>
                        <span class="bg-white text-purple-600 px-3 py-1 rounded-full text-sm font-semibold">Experiente</span>
                    </div>
                </div>
            </div>
        </div>

        <!-- Main Content -->
        <div class="grid grid-cols-1 md:grid-cols-3 gap-6">
            <!-- Left Column -->
            <div class="md:col-span-1 space-y-6">
                <!-- Contact -->
                <div class="bg-white rounded-xl p-6 shadow-md card-hover transition-all duration-300">
                    <h2 class="text-xl font-bold mb-4 text-blue-600 flex items-center">
                        <i class="fas fa-address-card mr-2"></i> Contato
                    </h2>
                    <ul class="space-y-3">
                        <li class="flex items-center">
                            <i class="fas fa-phone text-blue-500 mr-3 w-5"></i>
                            <span>(00) 00000-0000</span>
                        </li>
                        <li class="flex items-center">
                            <i class="fas fa-envelope text-blue-500 mr-3 w-5"></i>
                            <span>email@exemplo.com</span>
                        </li>
                        <li class="flex items-center">
                            <i class="fas fa-map-marker-alt text-blue-500 mr-3 w-5"></i>
                            <span>Cidade, Estado</span>
                        </li>
                        <li class="flex items-center">
                            <i class="fab fa-linkedin text-blue-500 mr-3 w-5"></i>
                            <span>linkedin.com/in/usuario</span>
                        </li>
                    </ul>
                </div>

                <!-- Skills -->
                <div class="bg-white rounded-xl p-6 shadow-md card-hover transition-all duration-300">
                    <h2 class="text-xl font-bold mb-4 text-blue-600 flex items-center">
                        <i class="fas fa-star mr-2"></i> Habilidades
                    </h2>
                    <div class="space-y-3">
                        <div>
                            <div class="flex justify-between mb-1">
                                <span class="text-sm font-medium">Liderança</span>
                                <span class="text-sm">90%</span>
                            </div>
                            <div class="w-full bg-gray-200 rounded-full h-2">
                                <div class="bg-blue-600 h-2 rounded-full" style="width: 90%"></div>
                            </div>
                        </div>
                        <div>
                            <div class="flex justify-between mb-1">
                                <span class="text-sm font-medium">Comunicação</span>
                                <span class="text-sm">85%</span>
                            </div>
                            <div class="w-full bg-gray-200 rounded-full h-2">
                                <div class="bg-blue-600 h-2 rounded-full" style="width: 85%"></div>
                            </div>
                        </div>
                        <div>
                            <div class="flex justify-between mb-1">
                                <span class="text-sm font-medium">Trabalho em equipe</span>
                                <span class="text-sm">95%</span>
                            </div>
                            <div class="w-full bg-gray-200 rounded-full h-2">
                                <div class="bg-blue-600 h-2 rounded-full" style="width: 95%"></div>
                            </div>
                        </div>
                    </div>
                </div>
            </div>

            <!-- Right Column -->
            <div class="md:col-span-2 space-y-6">
                <!-- Education -->
                <div class="bg-white rounded-xl p-6 shadow-md card-hover transition-all duration-300">
                    <h2 class="text-xl font-bold mb-4 text-blue-600 flex items-center">
                        <i class="fas fa-graduation-cap mr-2"></i> Formação Acadêmica
                    </h2>
                    <div id="formacao" class="space-y-4">
                        <!-- JavaScript will populate this -->
                    </div>
                </div>

                <!-- Experience -->
                <div class="bg-white rounded-xl p-6 shadow-md card-hover transition-all duration-300">
                    <h2 class="text-xl font-bold mb-4 text-blue-600 flex items-center">
                        <i class="fas fa-briefcase mr-2"></i> Experiência Profissional
                    </h2>
                    <div id="experiencia" class="space-y-4">
                        <!-- JavaScript will populate this -->
                    </div>
                </div>
            </div>
        </div>

        <!-- Footer -->
        <div class="mt-8 text-center text-gray-500 text-sm">
            <p>Atualizado em <span id="data-atual"></span></p>
        </div>
    </div>

    <script>
        // Sample data based on the Python class
        const curriculo = {
            nome: "Ana Silva",
            idade: 32,
            formacao: [
                {
                    curso: "Bacharelado em Administração",
                    instituicao: "Universidade Federal",
                    periodo: "2010 - 2014"
                },
                {
                    curso: "MBA em Gestão de Projetos",
                    instituicao: "FGV",
                    periodo: "2015 - 2017"
                }
            ],
            experiencia: [
                {
                    cargo: "Gerente de Projetos",
                    empresa: "Tech Solutions Ltda",
                    periodo: "2018 - Presente",
                    descricao: "Liderança de equipes multidisciplinares, gestão de orçamentos e prazos, implementação de metodologias ágeis."
                },
                {
                    cargo: "Analista de Negócios",
                    empresa: "Consultoria Empresarial",
                    periodo: "2015 - 2018",
                    descricao: "Análise de processos, identificação de oportunidades de melhoria, elaboração de relatórios gerenciais."
                }
            ]
        };

        // Populate the page with data
        document.getElementById('nome').textContent = curriculo.nome;
        document.getElementById('idade').textContent = `${curriculo.idade} anos`;

        // Format education
        const formacaoContainer = document.getElementById('formacao');
        curriculo.formacao.forEach(item => {
            const div = document.createElement('div');
            div.className = 'border-l-4 border-blue-500 pl-4';
            div.innerHTML = `
                <h3 class="font-bold text-lg">${item.curso}</h3>
                <p class="text-gray-600">${item.instituicao}</p>
                <p class="text-gray-500 text-sm">${item.periodo}</p>
            `;
            formacaoContainer.appendChild(div);
        });

        // Format experience
        const experienciaContainer = document.getElementById('experiencia');
        curriculo.experiencia.forEach(item => {
            const div = document.createElement('div');
            div.className = 'border-l-4 border-purple-500 pl-4';
            div.innerHTML = `
                <h3 class="font-bold text-lg">${item.cargo}</h3>
                <p class="text-gray-600">${item.empresa}</p>
                <p class="text-gray-500 text-sm mb-2">${item.periodo}</p>
                <p class="text-gray-700">${item.descricao}</p>
            `;
            experienciaContainer.appendChild(div);
        });

        // Add current date
        const options = { year: 'numeric', month: 'long', day: 'numeric' };
        document.getElementById('data-atual').textContent = new Date().toLocaleDateString('pt-BR', options);
    </script>
</body>
</html>