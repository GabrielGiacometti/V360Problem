import { FetchRequest } from '@rails/request.js'

document.addEventListener("DOMContentLoaded", function() {
    document.addEventListener("change", async function(event) {
        const target = event.target;
        if (target.classList.contains("check")) {
            const isChecked = target.checked;
            const url = `/tasks/${target.id.replace("check_", "")}`;

            const request = new FetchRequest('put', url, { 
                headers: {
                    'Accept': 'application/json',
                    'Content-Type': 'application/json',
                },
                body: JSON.stringify({ 
                    task: { done: isChecked } 
                })
            });

            try {
                const response = await request.perform();
            } catch (error) {
                console.error('Erro:', error);
            }
        }
    });
});
