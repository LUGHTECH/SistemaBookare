const txt = document.querySelector(".text-sinopse");
const textInitialHeight = txt.clientHeight;
const overflow = document.querySelector(".overflow");
const btn = document.querySelector(".toggle");

btn.addEventListener("click", () => {
    const isMore = btn.dataset.state === "more";

    const scrollY = window.scrollY;

    // alterna a altura
    txt.style.maxHeight = isMore ? `${txt.scrollHeight}px` : `${textInitialHeight}px`;

    // muda o texto e o estado do botão
    btn.dataset.state = isMore ? "less" : "more";
    btn.textContent = isMore ? "Leia menos" : "Leia mais";

    // alterna o estado do overflow
    overflow.dataset.state = isMore ? "hidden" : "visible";

    window.scrollTo(0, scrollY);
});
