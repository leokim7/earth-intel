/* SGMA — shared interactions & animations */
(function () {
  'use strict';
  var reduced = window.matchMedia('(prefers-reduced-motion: reduce)').matches;

  /* nav: scrolled shadow */
  var nav = document.querySelector('.nav');
  var onScroll = function () {
    if (nav) nav.classList.toggle('scrolled', window.scrollY > 8);
  };
  window.addEventListener('scroll', onScroll, { passive: true });
  onScroll();

  /* mobile burger + dropdown tap */
  var burger = document.querySelector('.nav__burger');
  var menu = document.querySelector('.nav__menu');
  if (burger && menu) {
    burger.addEventListener('click', function () { menu.classList.toggle('open'); });
  }
  document.querySelectorAll('.dd > a').forEach(function (a) {
    a.addEventListener('click', function (e) {
      if (window.matchMedia('(hover: none)').matches || window.innerWidth <= 768) {
        e.preventDefault();
        a.parentElement.classList.toggle('open');
      }
    });
  });

  /* hero stagger */
  var hero = document.querySelector('.hero');
  if (hero) requestAnimationFrame(function () { hero.classList.add('loaded'); });

  /* scroll reveal */
  var io = new IntersectionObserver(function (entries) {
    entries.forEach(function (en) {
      if (en.isIntersecting) { en.target.classList.add('in'); io.unobserve(en.target); }
    });
  }, { threshold: 0.14 });
  document.querySelectorAll('[data-reveal], .dg').forEach(function (el) { io.observe(el); });

  /* stagger helper: children of [data-stagger] get incremental delays */
  document.querySelectorAll('[data-stagger]').forEach(function (wrap) {
    var step = parseFloat(wrap.getAttribute('data-stagger')) || 0.09;
    Array.prototype.forEach.call(wrap.children, function (child, i) {
      child.setAttribute('data-reveal', '');
      child.style.setProperty('--d', (i * step).toFixed(2) + 's');
      io.observe(child);
    });
  });

  /* count-up (data-count="83" data-suffix="만+" data-decimals="1") */
  var cio = new IntersectionObserver(function (entries) {
    entries.forEach(function (en) {
      if (!en.isIntersecting) return;
      cio.unobserve(en.target);
      var el = en.target;
      var target = parseFloat(el.getAttribute('data-count'));
      var dec = parseInt(el.getAttribute('data-decimals') || '0', 10);
      var pre = el.getAttribute('data-prefix') || '';
      var suf = el.getAttribute('data-suffix') || '';
      if (reduced) { el.textContent = pre + target.toFixed(dec) + suf; return; }
      var t0 = null, dur = 1400;
      var tick = function (ts) {
        if (!t0) t0 = ts;
        var p = Math.min((ts - t0) / dur, 1);
        var eased = 1 - Math.pow(1 - p, 3);
        el.textContent = pre + (p >= 1 ? target.toFixed(dec) : (target * eased).toFixed(dec)) + suf;
        if (p < 1) requestAnimationFrame(tick);
      };
      requestAnimationFrame(tick);
    });
  }, { threshold: 0.5 });
  document.querySelectorAll('[data-count]').forEach(function (el) { cio.observe(el); });

  /* pipeline sequence: [data-seq] cycles .hot across .pipe__step children */
  document.querySelectorAll('[data-seq]').forEach(function (pipe) {
    if (reduced) return;
    var steps = pipe.querySelectorAll('.pipe__step');
    if (!steps.length) return;
    var i = -1;
    var sio = new IntersectionObserver(function (entries) {
      entries.forEach(function (en) {
        if (en.isIntersecting && !pipe._timer) {
          pipe._timer = setInterval(function () {
            i = (i + 1) % steps.length;
            steps.forEach(function (s, j) {
              s.classList.toggle('hot', j === i);
              s.classList.toggle('dim', j !== i);
            });
          }, 1200);
        } else if (!en.isIntersecting && pipe._timer) {
          clearInterval(pipe._timer); pipe._timer = null;
        }
      });
    }, { threshold: 0.4 });
    sio.observe(pipe);
  });

  /* diagram flow: sequential delays for .dg children */
  document.querySelectorAll('.dg').forEach(function (dg) {
    var seq = dg.querySelectorAll('.dg__srcrow, .dg__step, .dg__out');
    seq.forEach(function (el, i) {
      el.style.transitionDelay = (0.08 * i).toFixed(2) + 's';
    });
  });

  /* footer year */
  document.querySelectorAll('[data-year]').forEach(function (el) {
    el.textContent = new Date().getFullYear();
  });
})();
